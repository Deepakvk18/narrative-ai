// components/Story.tsx
import React, { useState } from 'react';
import { motion, useScroll } from 'framer-motion';
import Pages from './Card';
import Card from './Card';
import StoryCard from './StoryCard';


const Story = ({ story, onSubmit }) => {

    const { scrollYProgress } = useScroll();

    console.log(onSubmit);
    

  return (
    <motion.div
      className="flex-grow p-6 bg-white shadow-lg rounded-lg relative overflow-y-auto"
      initial={{ x: '100%' }}
      animate={{ x: 0 }}
      transition={{ type: 'spring', stiffness: 120, duration: 1, delay: 0.5 }}
    >
        <motion.div className='progress-bar bg-blue-400' style={{ scaleX: scrollYProgress }} />      
      <motion.div
        className="bg-green-500 text-white py-2 px-4 rounded-md absolute top-4 right-4"
        initial={{ scale: 0 }}
        animate={{ scale: 1 }}
        transition={{ duration: 0.5, delay: 2 }}
      >
        Story Generated!
      </motion.div>
      <div className='flex flex-col'>
        { story?.map((s, index)=>
            <StoryCard story={s} index={index} onSubmit={onSubmit} />
        ) }
      </div>
    </motion.div>
  );
};

export default Story;
