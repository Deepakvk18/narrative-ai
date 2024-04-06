import React from 'react'
import FormContext from './FormContext'

const Providers = ({ children }) => {
  return (
    <FormContext>
      {children}
    </FormContext>
  )
}

export default Providers