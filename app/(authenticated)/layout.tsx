import { ReactNode, useContext } from 'react';
import { useSession } from 'next-auth/react';
import { useRouter } from 'next/navigation';
import { NotificationContext } from '@/components/features/Notification';

export default function PrivateLayout({ children }: { children: ReactNode }) {
  const session = useSession();
  const router = useRouter();
  const { notify } = useContext(NotificationContext);

  if (session.status === 'unauthenticated') {
    router.push('/signin');
    notify({ message: 'Login to access this page', type: 'error' });
  }

  return { children };
}
