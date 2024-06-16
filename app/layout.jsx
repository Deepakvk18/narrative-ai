import { Inter } from 'next/font/google';
import './globals.css';
import Providers from '@/components/Providers';

const inter = Inter({ subsets: ['latin'] });

export const metadata = {
  title: 'The Enchanted Story Teller',
  description: 'AI Story Teller',
};

export default function RootLayout({ children }) {
  return (
    <html lang="en">
      <body className={`${inter.className} text-black no-scrollbar`}>
        <Providers>{children}</Providers>
      </body>
    </html>
  );
}
