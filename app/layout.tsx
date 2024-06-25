import { Inter } from 'next/font/google';
import './globals.css';
import Providers from '@/components/features/Providers';
import { ReactNode } from 'react';
import Navbar from '@/components/NavBar';

const inter = Inter({ subsets: ['latin'] });

export const metadata = {
  title: 'The Enchanted Story Teller',
  description: 'AI Story Teller',
};

export default function RootLayout({ children }: { children: ReactNode }) {
  return (
    <html lang="en">
      <body
        className={`${inter.className} bg-white dark:bg-black no-scrollbar`}
      >
        <Providers>
          <Navbar />
          {children}
        </Providers>
      </body>
    </html>
  );
}
