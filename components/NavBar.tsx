'use client';

import React from 'react';
import { Sun, Moon } from 'lucide-react';
import { Avatar, AvatarFallback, AvatarImage } from '@/components/ui/avatar';
import { Button } from '@/components/ui/button';
import Image from 'next/image';
import {
  DropdownMenu,
  DropdownMenuContent,
  DropdownMenuItem,
  DropdownMenuTrigger,
} from '@/components/ui/dropdown-menu';
import { useTheme } from 'next-themes';
import { signOut, useSession } from 'next-auth/react';
import { useRouter } from 'next/navigation';
import Link from 'next/link';

const Navbar = () => {
  const { resolvedTheme, setTheme } = useTheme();
  const router = useRouter();
  const session = useSession();
  const user = session.data?.user;
  const isLoggedIn = session.status === 'authenticated';

  return (
    <nav
      className={`flex items-center justify-between p-4 dark:bg-black dark:text-white bg-white text-gray-800 border-b-[1px] border-gray-600`}
    >
      <div className="flex items-center">
        <Image
          src="/api/placeholder/50/50"
          alt="Logo"
          width={12}
          height={12}
          className="h-8 w-8 mr-2"
        />
        <span className="text-xl font-bold">Your Logo</span>
      </div>
      <div className="flex items-center space-x-4">
        <Button
          variant="ghost"
          size="icon"
          onClick={() => setTheme(resolvedTheme === 'light' ? 'dark' : 'light')}
          aria-label="Toggle theme"
        >
          {resolvedTheme === 'light' ? (
            <Moon className="h-5 w-5" />
          ) : (
            <Sun className="h-5 w-5" />
          )}
        </Button>
        {isLoggedIn ? (
          <DropdownMenu>
            <DropdownMenuTrigger asChild>
              <Button
                variant="ghost"
                className="flex rounded-full h-12 w-12 items-center space-x-2"
              >
                <Avatar>
                  <AvatarImage src={user?.image || ''} alt="User avatar" />
                  <AvatarFallback>
                    {user?.email?.charAt(0).toUpperCase()}
                  </AvatarFallback>
                </Avatar>
              </Button>
            </DropdownMenuTrigger>
            <DropdownMenuContent align="end">
              <DropdownMenuItem>
                <Link href={'/profile'}>Profile</Link>
              </DropdownMenuItem>
              <DropdownMenuItem>
                <Link href={'/settings'}>Settings</Link>
              </DropdownMenuItem>
              <DropdownMenuItem onClick={() => signOut()}>
                Logout
              </DropdownMenuItem>
            </DropdownMenuContent>
          </DropdownMenu>
        ) : (
          <Button onClick={() => router.push('/signin')}>Login</Button>
        )}
      </div>
    </nav>
  );
};

export default Navbar;
