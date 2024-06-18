/* eslint-disable import/no-extraneous-dependencies */
import CredentialsProvider from 'next-auth/providers/credentials';
import prisma from '@/db';
import bcrypt from 'bcrypt';
import { NextAuthOptions, Session } from 'next-auth';
import { PrismaAdapter } from '@next-auth/prisma-adapter';
import { JWT } from 'next-auth/jwt';

interface IUser {
  id: string;
  name: string | null;
  email: string;
  token: string;
}

export interface ISession extends Session {
  user: {
    id: string;
    jwtToken: string;
    role: string;
    email: string;
    name: string;
  };
}

interface IToken extends JWT {
  uid: string;
  jwtToken: string;
}

export const authOptions = {
  adapter: PrismaAdapter(prisma),
  providers: [
    CredentialsProvider({
      name: 'Credentials',
      credentials: {
        username: { label: 'email', type: 'text', placeholder: '' },
        password: { label: 'password', type: 'password', placeholder: '' },
      },
      async authorize(
        credentials: Record<'username' | 'password', string> | undefined,
      ) {
        if (!credentials) return null;
        const hashedPassword = await bcrypt.hash(credentials.password, 10);

        const userDb = await prisma.user.findFirst({
          where: {
            email: credentials.username,
          },
          include: {
            projectRights: true,
          },
        });
        if (
          userDb &&
          userDb.password &&
          (await bcrypt.compare(credentials.password, userDb.password))
        ) {
          return {
            id: userDb.id.toString(),
            name: userDb.name,
            email: credentials.username,
          };
        }

        try {
          const data = await prisma.user.create({
            data: {
              email: credentials.username,
              password: hashedPassword,
              signupType: 'email',
            },
            include: {
              projectRights: true,
            },
          });
          return {
            id: data.id.toString(),
            name: data.name,
            email: data.email,
          };
        } catch (e) {
          return null;
        }
      },
    }),
  ],
  secret: process.env.NEXTAUTH_SECRET || 'secr3t',
  callbacks: {
    jwt: async ({ token: jwtToken, user: currentUser }): Promise<JWT> => {
      const newToken: IToken = jwtToken as IToken;

      if (currentUser) {
        newToken.uid = currentUser.id;
        newToken.jwtToken = (currentUser as IUser).token;
      }
      return newToken;
    },
  },
  pages: {
    signIn: '/signin',
  },
} satisfies NextAuthOptions;
