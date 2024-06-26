import { profileSchema } from '@/app/types/user.types';
import prisma from '@/db';
import { NextRequest, NextResponse } from 'next/server';

export const POST = async (
  req: NextRequest,
  { params }: { params: { id: string } },
) => {
  const body = profileSchema.parse(await req.json());
  const { id } = params;
  const update = await prisma.user.update({
    where: {
      id,
    },
    data: {
      email: body.email,
      image: body.image,
      name: body.name,
    },
  });
  return NextResponse.json(update);
};

export const GET = async (
  req: NextRequest,
  { params }: { params: { id: string } },
) => {
  const { id } = params;
  const user = await prisma.user.findFirst({
    where: {
      id,
    },
    include: {
      projectRights: true,
      projects: true,
    },
  });
  return NextResponse.json(user);
};
