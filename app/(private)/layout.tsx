'use client';

import { ReactNode, useContext, useLayoutEffect } from 'react';
import { redirect } from 'next/navigation';
import { NotificationContext } from '@/components/features/Notification';
import { useSession } from 'next-auth/react';

export default function PrivateLayout({ children }: { children: ReactNode }) {
  const session = useSession();
  const { notify } = useContext(NotificationContext);

  useLayoutEffect(() => {
    if (session.status === 'unauthenticated') {
      notify({ message: 'Login to access this page', type: 'error' });
      redirect('/signin');
    }
  }, [session]);

  return <>{children}</>;
}
