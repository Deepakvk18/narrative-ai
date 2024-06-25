import maxios from '@/lib/axios';
import { Profile } from '../types/user.types';

export const updateProfile = async ({
  data,
  userId,
}: {
  data: Profile;
  userId: string | undefined;
}) => {
  try {
    const response = await maxios.post(`/api/user/${userId || ''}`, data);
    return response.data;
  } catch (error) {
    return error;
  }
};
