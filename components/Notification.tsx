'use client';

import React, { ReactNode, createContext, useEffect, useState } from 'react';
import { Bounce, ToastContainer, TypeOptions, toast } from 'react-toastify';

interface INotificationContext {
  setMessages: Function;
}

interface IMessageNotification {
  message: string;
  type: TypeOptions;
}

const defaultValue = {
  setMessages: () => {},
};

export const NotificationContext =
  createContext<INotificationContext>(defaultValue);

export const Notification = ({ children }: { children: ReactNode }) => {
  const [messages, setMessages] = useState<IMessageNotification>();

  useEffect(() => {
    if (messages)
      toast(messages.message, {
        position: 'top-right',
        autoClose: 5000,
        hideProgressBar: false,
        closeOnClick: true,
        pauseOnHover: true,
        draggable: true,
        progress: undefined,
        theme: 'dark',
        transition: Bounce,
        type: messages.type,
      });
  }, [messages]);

  return (
    <NotificationContext.Provider value={{ setMessages }}>
      <ToastContainer />
      {children}
    </NotificationContext.Provider>
  );
};

export default NotificationContext;
