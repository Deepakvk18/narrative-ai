// components/Story.tsx
import React from 'react';
import { motion, useScroll } from 'framer-motion';
import StoryCard from './StoryCard';

const Story = ({ story, onSubmit, setStory }) => {
  const { scrollYProgress } = useScroll();

  return (
    <motion.div
      className="flex-grow p-6 bg-white shadow-lg rounded-lg relative overflow-y-auto h-full no-scrollbar"
      initial={{ x: '100%' }}
      animate={{ x: 0 }}
      transition={{ type: 'spring', stiffness: 120, duration: 1, delay: 0.5 }}
    >
      <motion.div
        className="progress-bar bg-blue-400"
        style={{ scaleX: scrollYProgress }}
      />
      <div className="flex flex-col no-scrollbar gap-4">
        {story?.map((s, index) => (
          <StoryCard
            key={index}
            s={s}
            index={index}
            onSubmit={onSubmit}
            story={story}
            setStory={setStory}
          />
        ))}
      </div>
    </motion.div>
  );
};

export default Story;
