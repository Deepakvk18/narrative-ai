import React, { useContext, useState } from 'react';
import { MyContext } from './FormContext';
import DialogueBox from './DialogPopUp';

const StoryCard = ({
  s,
  index,
  onSubmit,
  setStory,
}: {
  s: string;
  index: number;
  onSubmit: Function;
  setStory: Function;
}) => {
  const [nextChpt, setNextChpt] = useState(false);
  const [edit, setEdit] = useState(false);
  const [customPrompt, setCustomPrompt] = useState('');

  const { formState, setFormState } = useContext(MyContext);

  const onNextChapter = (e: Event) => {
    e.preventDefault();
    setFormState((prev: any) => ({ ...prev, customPrompt }));
    onSubmit(formState);
  };

  const onEdit = (e: Event) => {
    e.preventDefault();
    setStory((prev: any) => prev.slice(0, index));
    setFormState((prev: any) => {
      return { ...prev, pageNo: index - 1 };
    });
    onSubmit(formState);
  };

  return (
    <div className="relative w-full flex flex-col gap-4">
      <div className="flex w-full bg-slate-500 rounded-md p-5">
        {s}
        <button
          onClick={() => setEdit(true)}
          className="absolute top-2 right-2 bg-blue-500 text-white py-1 px-2 rounded-md hover:bg-blue-600 transition-colors duration-300"
        >
          Edit
        </button>
      </div>
      {formState.pageNo === index + 1 && (
        <div className="flex w-full">
          <button
            onClick={onNextChapter as any}
            disabled={formState.pageNo >= index + 1}
            type="submit"
            className="bg-blue-500 text-white py-2 px-4 rounded-md hover:bg-blue-600 transition-colors duration-300 right-5 w-80"
          >
            Next Chapter
          </button>
        </div>
      )}
      {edit && (
        <DialogueBox
          title={'Change prompt for this chapter'}
          onCancel={() => {
            setEdit(false);
            setCustomPrompt('');
          }}
          onConfirm={onEdit}
          value={customPrompt}
          onChange={setCustomPrompt}
        />
      )}
      {nextChpt && (
        <DialogueBox
          title={'Create prompt for the next chapter'}
          onCancel={() => {
            setNextChpt(false);
            setCustomPrompt('');
          }}
          onConfirm={onNextChapter}
          value={customPrompt}
          onChange={setCustomPrompt}
        />
      )}
    </div>
  );
};

export default StoryCard;
