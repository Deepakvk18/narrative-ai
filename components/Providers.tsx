import React, { ReactNode } from 'react';
import FormContext from './FormContext';
import { Notification } from './Notification';

const Providers = ({ children }: { children: ReactNode }) => {
  return (
    <Notification>
      <FormContext>{children}</FormContext>
    </Notification>
  );
};

export default Providers;
