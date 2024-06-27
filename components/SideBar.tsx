import React from 'react';
import { Button } from './ui/button';

const SideBar = () => {
  const sideBarLinks = [
    {
      href: '/projects',
      label: 'Projects',
    },
    {
      href: '/characters',
      label: 'Characters',
    },
    {
      href: '/timelines',
      label: 'Timelines',
    },
    {
      href: '/places',
      label: 'Places',
    },
    {
      href: 'relationships',
      label: 'Relationships',
    },
  ];
  return (
    <nav className="flex flex-col p-10">
      <div className="flex-1 flex flex-col py-4 items-center">
        {sideBarLinks.map((link, index) => (
          <Button
            key={index}
            variant="ghost"
            className="w-full justify-start text-left px-4 py-10"
            asChild
          >
            <a href={link.href} className="flex items-center space-x-4">
              {/* <link.icon className="h-5 w-5" /> */}
              <span className="text-2xl">{link.label}</span>
            </a>
          </Button>
        ))}
      </div>
    </nav>
  );
};

export default SideBar;
