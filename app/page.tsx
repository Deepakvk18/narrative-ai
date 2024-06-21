'use client';

import React, { useContext, useState } from 'react';
import Head from 'next/head';
import { motion } from 'framer-motion';
import axios from 'axios';
import { MyContext } from '@/components/FormContext';
import { NotificationContext } from '@/components/features/Notification';
import Story from '../components/Story';
import Form from '../components/Form';

const Page = () => {
  const [story, setStory] = useState<any[]>([]);
  const [currentPage, setCurrentPage] = useState(0);

  const { setFormState } = useContext(MyContext);
  const { notify } = useContext(NotificationContext);

  const generateStory = async (data: any) => {
    const storySoFar = data;
    storySoFar.history = story.join('.\n');
    storySoFar.pageNo = currentPage;
    try {
      const response = await axios.post('/generate-story', storySoFar);
      setStory((prev) => [...prev, response.data]);
      setFormState(data);
      setCurrentPage(data.pageNo + 1);
    } catch (error: any) {
      notify({ message: error?.message, type: 'error' });
    }
  };

  return (
    <div className="flex max-h-screen w-screen pb-10 no-scrollbar">
      <Head>
        <meta name="description" content="Generate personalized stories" />
        <link rel="icon" href="/favicon.ico" />
      </Head>

      <motion.div
        className="flex flex-col w-2/5 bg-gray-100 h-screen"
        initial={{ x: '-100%' }}
        animate={{ x: 0 }}
        transition={{ type: 'spring', stiffness: 120, duration: 1 }}
      >
        <Form onSubmit={generateStory} disabled={story.length > 0} />
        <button
          onClick={() => {
            setStory([]);
            setFormState({});
            setCurrentPage(0);
          }}
          className="bg-blue-500 text-white py-2 px-4 rounded-md hover:bg-blue-600 transition-colors m-2 duration-300 "
        >
          Create New Story
        </button>
      </motion.div>

      <div className="flex-grow relative flex h-screen w-3/5 p-10">
        {story.length && (
          <Story story={story} onSubmit={generateStory} setStory={setStory} />
        )}
      </div>
    </div>
  );
};

export default Page;
