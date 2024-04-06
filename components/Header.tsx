// components/Header.js
import React from 'react';
import { motion } from 'framer-motion';

const Header = () => {
  return (
    <header className="text-center py-8 bg-blue-500">
      <motion.h1
        className="text-white text-3xl font-bold"
        initial={{ opacity: 0 }}
        animate={{ opacity: 1 }}
        transition={{ duration: 1 }}
      >
        The Enchanted Storyteller
      </motion.h1>
    </header>
  );
};

export default Header;
