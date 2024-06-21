import React, { ReactNode } from 'react';
import FormContext from '../FormContext';
import { Notification } from './Notification';
import { ThemeProvider } from './Theme';

const Providers = ({ children }: { children: ReactNode }) => {
  return (
    <ThemeProvider
      attribute="class"
      defaultTheme="light"
      enableSystem
      disableTransitionOnChange
    >
      <Notification>
        <FormContext>{children}</FormContext>
      </Notification>
    </ThemeProvider>
  );
};

export default Providers;
