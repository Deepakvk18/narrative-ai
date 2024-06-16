'use client';

import { ReactNode, createContext, useState } from 'react';

interface IMyContext {
  formState: any;
  themes: any;
  setFormState: any;
  setThemes: any;
}

export const MyContext = createContext<IMyContext>({
  formState: {},
  themes: {},
  setFormState: () => {},
  setThemes: () => {},
});

function FormContext({ children }: { children: ReactNode }) {
  const [formState, setFormState] = useState({});

  const [themes, setThemes] = useState({});

  return (
    <MyContext.Provider value={{ formState, themes, setFormState, setThemes }}>
      {children}
    </MyContext.Provider>
  );
}

export default FormContext;
