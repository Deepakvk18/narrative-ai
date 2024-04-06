"use client"

import React, { useContext, useState } from 'react'
import Card from './Card'
import { MyContext } from './FormContext'

const StoryCard = ({ story, index, onSubmit }) => {

    const [hueA, setHueA] = useState(340)
    const [hueB, setHueB] = useState(200)

    console.log(onSubmit);

    const { formState, setFormState } = useContext(MyContext)

    const onNextChapter = (e)=>{
        e.preventDefault()
        setFormState((prev)=>{return { ...prev, pageNo: prev.pageNo + 1  }})
        onSubmit(formState)
    }
    
  return (
    <div className='flex w-full flex-col'>
        Chapter: { index + 1}
        <div className='flex w-full gap-5 bg-slate-500 rounded-md p-5'>
            <div className='flex w-3/4'>
                {story}
            </div>
            <div className='flex w-1/4'>
                <Card emoji={"🍅"} hueA={hueA} hueB={hueB} key={index} />
            </div>
        </div>
        { formState.pages === index + 1 && 
                <button 
                    onClick={onNextChapter} 
                    disabled={formState.pageNo >= index + 1}
                    type="submit" 
                    className="bg-blue-500 text-white py-2 px-4 rounded-md hover:bg-blue-600 transition-colors duration-300 float-right">
                        Next Chapter
                </button> }
    </div>
    
  )
}

export default StoryCard