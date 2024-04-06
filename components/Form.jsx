import React from 'react';
import { useForm } from 'react-hook-form';
import { zodResolver } from '@hookform/resolvers/zod';
import { z } from 'zod';

const schema = z.object({
  name: z.string(),
  setting: z.string(),
  element: z.string(),
  creature: z.string(),
  pages: z.coerce.number().int().positive().min(1),
  prompt: z.string()
}).required({
  name: true,
  setting: true,
  pages: true
});

const setting = [
  'Medieval',
  'Mythological',
  'Futuristic',
  'Fantasy',
  'Sci-Fi',
  'Horror',
  'Adventure',
  'Steampunk',
  'Post-Apocalyptic',
  'Superhero',
  'Magic Realism',
  'Cyberpunk',
  'Historical Fiction',
  'Dystopian',
  'Space Opera',
  'Urban Fantasy',
  'Time Travel',
  'Alternate History',
  'Epic Fantasy',
  'Gothic',
];

const elements = [
  "NA",
  "Air",
  "Water",
  "Fire",
  "Earth",
  "Lightning",
  "Lava",
  "Metal"
]

const creatures = [
  "NA",
  'Dragon',
  'Phoenix',
  'Unicorn',
  'Griffin',
  'Fairy',
  'Elf',
  'Dwarf',
  'Centaur',
  'Mermaid',
  'Werewolf',
  'Vampire',
  'Goblin',
  'Orc',
  'Troll',
  'Witch',
  'Wizard',
  'Demon',
  'Angel',
  'Giant',
  'Hydra',
];

const MyForm = ({ onSubmit, disabled }) => {
  const {
    register,
    handleSubmit,
    formState: { errors },
  } = useForm({
    resolver: zodResolver(schema),
  });

  return (
    <form onSubmit={handleSubmit(onSubmit)} className="w-full p-8 mx-auto mt-8">
      <label className="block mb-4">
        Your Name:
        <input type="text" {...register('name')} className="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:border-blue-500 focus:ring focus:ring-blue-500 focus:ring-opacity-50 caret-fuchsia-600 disabled:opacity-30" disabled={disabled}/>
        {errors.name && <span className="text-red-500">{errors.name.message}</span>}
      </label>
      <label className="block mb-4">
        Preferred Setting:
        <select {...register('setting')} disabled={disabled} className="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:border-blue-500 focus:ring focus:ring-blue-500 focus:ring-opacity-50 disabled:opacity-30">
          {setting.map((option) => (
            <option key={option} value={option}>{option}</option>
          ))}
        </select>
        {errors.setting && <span className="text-red-500">{errors.setting.message}</span>}
      </label>
      <label className="block mb-4">
        Favorite Creature:
        <select {...register('creature')} disabled={disabled} className="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:border-blue-500 focus:ring focus:ring-blue-500 focus:ring-opacity-50 disabled:opacity-30">
          {creatures.map((option) => (
            <option key={option} value={option}>{option}</option>
          ))}
        </select>
        
        {errors.creature && <span className="text-red-500">{errors.creature.message}</span>}
      </label>
      <label className="block mb-4">
        Favorite Element:
        <select {...register('element')} disabled={disabled} className="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:border-blue-500 focus:ring focus:ring-blue-500 focus:ring-opacity-50 disabled:opacity-30">
          {elements.map((option) => (
            <option key={option} value={option}>{option}</option>
          ))}
        </select>
        
        {errors.element && <span className="text-red-500">{errors.element.message}</span>}
      </label>
      <label className="block mb-4">
        Custom Prompt
        <textarea disabled={disabled} {...register('prompt')} className="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:border-blue-500 focus:ring focus:ring-blue-500 focus:ring-opacity-50 disabled:opacity-30" />
        {errors.pages && <span className="text-red-500">{errors.pages.prompt}</span>}
      </label>
      <label className="block mb-4">
        Number of Pages:
        <input type="number" disabled={disabled} {...register('pages')} className="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:border-blue-500 focus:ring focus:ring-blue-500 focus:ring-opacity-50 disabled:opacity-30" />
        {errors.pages && <span className="text-red-500">{errors.pages.message}</span>}
      </label>
      <button type="submit" disabled={disabled} className="bg-blue-500 text-white py-2 px-4 rounded-md hover:bg-blue-600 transition-colors duration-300 disabled:opacity-30">Generate Story</button>
    </form>
  );
};

export default MyForm;
