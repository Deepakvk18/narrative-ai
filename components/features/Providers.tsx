'use client';

import React, { ReactNode } from 'react';
import { SessionProvider } from 'next-auth/react';
import { QueryClient, QueryClientProvider } from '@tanstack/react-query';
import { RecoilRoot } from 'recoil';
import { Notification } from './Notification';
import { ThemeProvider } from './Theme';

const queryClient = new QueryClient();

const Providers = ({ children }: { children: ReactNode }) => {
  return (
    <SessionProvider>
      <ThemeProvider
        attribute="class"
        defaultTheme="light"
        enableSystem
        disableTransitionOnChange
      >
        <RecoilRoot>
          <QueryClientProvider client={queryClient}>
            <Notification>{children}</Notification>
          </QueryClientProvider>
        </RecoilRoot>
      </ThemeProvider>
    </SessionProvider>
  );
};

export default Providers;
