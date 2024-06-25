/* eslint-disable no-unused-vars */
// eslint-disable-document no-unused-vars
import { NextAuth, DefaultSession } from 'next-auth';

declare module 'next-auth' {
  interface Session {
    id: string;
    user: {
      id: string;
    } & DefaultSession['user'];
  }
}
