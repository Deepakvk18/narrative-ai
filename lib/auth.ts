/* eslint-disable import/no-extraneous-dependencies */
import CredentialsProvider from 'next-auth/providers/credentials';
import prisma from '@/db';
import bcrypt from 'bcrypt';
import { NextAuthOptions, Session } from 'next-auth';
import { PrismaAdapter } from '@next-auth/prisma-adapter';

export interface ISession extends Session {
  user: {
    id: string;
    jwtToken: string;
    role: string;
    email: string;
    name: string;
  };
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
    jwt: async ({ token, user }) => {
      if (user) {
        token.user = user;
      }
      return Promise.resolve(token);
    },
    session: async ({ session, token }) => {
      session.user = token.user;
      return Promise.resolve(session);
    },
  },
  pages: {
    signIn: '/signin',
  },
  session: {
    strategy: 'jwt',

    // Seconds - How long until an idle session expires and is no longer valid.
    maxAge: 30 * 24 * 60 * 60, // 30 days
    updateAge: 24 * 60 * 60, // 24 hours
  },
  debug: true,
} satisfies NextAuthOptions;
