'use client';

import React, { ReactNode, createContext } from 'react';
import { toast } from 'sonner';
import { Toaster } from './ui/sonner';

interface INotificationContext {
  notify: Function;
}

interface IMessageNotification {
  message: string;
  type: 'error' | 'warning' | 'info' | 'success';
}

const defaultValue = {
  notify: () => {},
};

export const NotificationContext =
  createContext<INotificationContext>(defaultValue);

export const Notification = ({ children }: { children: ReactNode }) => {
  const notify = (message: IMessageNotification) => {
    if (message.type === 'error') toast.error(message.message);
    else if (message.type === 'success') toast.success(message.message);
    else if (message.type === 'info') toast.info(message.message);
    else if (message.type === 'warning') toast.warning(message.message);
  };

  return (
    <NotificationContext.Provider value={{ notify }}>
      <Toaster
        invert
        closeButton
        duration={3000}
        richColors
        position="top-right"
      />
      {children}
    </NotificationContext.Provider>
  );
};

export default NotificationContext;
