'use client';

import { createContext, useState } from 'react';

export const MyContext = createContext();

function FormContext({ children }) {
  const [formState, setFormState] = useState({});

  const [themes, setThemes] = useState({});

  return (
    <MyContext.Provider value={{ formState, themes, setFormState, setThemes }}>
      {children}
    </MyContext.Provider>
  );
}

export default FormContext;
