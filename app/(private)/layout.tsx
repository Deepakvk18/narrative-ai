'use client';

import { ReactNode, useContext, useLayoutEffect, useState } from 'react';
import { redirect } from 'next/navigation';
import { NotificationContext } from '@/components/features/Notification';
import { useSession } from 'next-auth/react';
import SideBar from '@/components/SideBar';
import { Menu, X } from 'lucide-react';
import { Button } from '@/components/ui/button';

export default function PrivateLayout({ children }: { children: ReactNode }) {
  const session = useSession();
  const { notify } = useContext(NotificationContext);
  const [sidebarOpen, setSidebarOpen] = useState(false);

  useLayoutEffect(() => {
    if (session.status === 'unauthenticated') {
      notify({ message: 'Login to access this page', type: 'error' });
      redirect('/signin');
    }
  }, [session, notify]);

  return (
    <div className="flex max-h-screen max-w-screen overflow-hidden bg-background">
      <div
        className={`fixed inset-y-0 left-0 transform ${sidebarOpen ? 'translate-x-0' : '-translate-x-full'} lg:relative lg:translate-x-0 transition duration-200 ease-in-out z-30 w-64 bg-card shadow-lg lg:shadow-none`}
      >
        <div className="flex items-center justify-between p-4 lg:hidden">
          <h2 className="text-2xl font-semibold">Menu</h2>
          <Button
            variant="ghost"
            size="icon"
            onClick={() => setSidebarOpen(false)}
          >
            <X className="h-6 w-6" />
          </Button>
        </div>
        <SideBar />
      </div>
      <div className="flex-1 flex flex-col overflow-hidden">
        <header className="lg:hidden bg-card shadow-sm">
          <div className="p-4">
            <Button
              variant="ghost"
              size="icon"
              onClick={() => setSidebarOpen(true)}
            >
              <Menu className="h-6 w-6" />
            </Button>
          </div>
        </header>
        <main className="flex-1 overflow-x-hidden overflow-y-auto bg-background">
          <div className="container mx-auto px-4 py-8">{children}</div>
        </main>
      </div>
    </div>
  );
}
