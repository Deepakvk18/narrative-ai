import React from 'react';

const DialogueBox = ({
  title,
  value,
  onChange,
  onCancel,
  onConfirm,
}: {
  title: string;
  value: string;
  onChange: any;
  onCancel: any;
  onConfirm: any;
}) => {
  return (
    <div className="fixed z-10 inset-0 w-screen h-screen flex items-center justify-center bg-gray-800 bg-opacity-75">
      <div className="w-96 bg-white rounded-lg shadow-lg p-8">
        <h2 className="text-2xl font-bold mb-4">{title}</h2>
        <label className="block mb-4">
          Custom Prompt:
          <textarea
            className="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:border-blue-500 focus:ring focus:ring-blue-500 focus:ring-opacity-50"
            value={value}
            onChange={(e) => onChange(e.target.value)}
          />
        </label>
        <div className="flex justify-end">
          <button
            onClick={onConfirm}
            className="bg-blue-500 text-white py-2 px-4 rounded-md hover:bg-blue-600 transition-colors mr-2"
          >
            Confirm
          </button>
          <button
            onClick={onCancel}
            className="bg-gray-500 text-white py-2 px-4 rounded-md hover:bg-gray-600 transition-colors"
          >
            Cancel
          </button>
        </div>
      </div>
    </div>
  );
};

export default DialogueBox;
