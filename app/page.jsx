"use client"

import React, { useContext, useState } from 'react';
import Head from 'next/head';
import Form from '../components/Form';
import Story from '../components/Story';
import { motion } from 'framer-motion';
import axios from 'axios';
import { Bounce, ToastContainer, toast } from 'react-toastify';
import { MyContext } from '@/components/FormContext';

const Page = () => {

  const [story, setStory] = useState([]);
  const [currentPage, setCurrentPage] = useState(1);

  const { setFormState } = useContext(MyContext)

  const generateStory = async ( data ) => {

    data.history = story.join(".\n")
    try {
      const response = await axios.post("/generate-story", data)
      setStory((prev)=>[...prev, response.data]);
      setFormState(data)
    } catch (error) {
      console.error(error);
      toast(`⚠️ ${error?.message}`, {
        position: "top-right",
        autoClose: 5000,
        hideProgressBar: false,
        closeOnClick: true,
        pauseOnHover: true,
        draggable: true,
        progress: undefined,
        theme: "light",
        transition: Bounce,
        type: "error"
        });    }
  };

  return (
    <div className="fixed flex min-h-screen w-screen pb-10">
      <ToastContainer />
      <Head>
        <meta name="description" content="Generate personalized stories" />
        <link rel="icon" href="/favicon.ico" />
      </Head>

      <motion.div
        className="flex flex-col w-1/5 bg-gray-100 h-screen"
        initial={{ x: '-100%' }}
        animate={{ x: 0 }}
        transition={{ type: 'spring', stiffness: 120, duration: 1 }}
      >
        <Form onSubmit={generateStory} />
      </motion.div>

      <div className="flex-grow relative flex m-10 w-4/5">
        {story.length && <Story story={story} onSubmit={generateStory} />}
      </div>
      
    </div>
  );
};

export default Page;
