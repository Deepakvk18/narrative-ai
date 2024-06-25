'use client';

import React, { useContext, useEffect, useMemo, useState } from 'react';
import { useForm } from 'react-hook-form';
import { zodResolver } from '@hookform/resolvers/zod';
import { Avatar, AvatarFallback, AvatarImage } from '@/components/ui/avatar';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card';
import { Pencil, Save, Coins, Upload } from 'lucide-react';
import {
  Form,
  FormControl,
  FormField,
  FormItem,
  FormLabel,
  FormMessage,
} from '@/components/ui/form';
import { useSession } from 'next-auth/react';
import { Profile, profileSchema } from '@/app/types/user.types';
import { useMutation } from '@tanstack/react-query';
import { updateProfile } from '@/app/apis/user';
import { NotificationContext } from '@/components/features/Notification';
import {
  LineChart,
  BarChart,
  PieChart,
  Line,
  Bar,
  Pie,
  XAxis,
  YAxis,
  Tooltip,
  Legend,
  ResponsiveContainer,
} from 'recharts';

async function getPresignedUrl() {
  return {
    url: 'https://staticg.sportskeeda.com',
    fields: { key: 'editor/2023/02/d7a96-16775298337085-1920.jpg' },
  };
}

async function uploadImage(url: string, file: File) {
  // await fetch(url, {
  //   method: 'PUT',
  //   body: file,
  //   headers: {
  //     'Content-Type': file.type,
  //   },
  // });
  return { url, file };
}

const ProfilePage = () => {
  const session = useSession();
  const user = useMemo(() => session.data?.user, [session]);
  const [isUploading, setIsUploading] = useState(false);
  const [isEditing, setIsEditing] = useState<Record<string, boolean>>({
    name: !user?.name,
    email: false,
  });
  const [tokens, setTokens] = useState(1000); // Assuming initial token count
  const form = useForm({
    resolver: zodResolver(profileSchema),
    defaultValues: {
      name: user?.name?.toString() || '',
      email: user?.email?.toString() || '',
      image: user?.image?.toString() || '',
    },
  });
  useEffect(() => {
    if (session.status === 'authenticated') {
      form.reset({
        name: session.data.user.name || '',
        email: session.data.user.email || '',
        image: session.data.user.image || '',
      });
      setIsEditing({
        name: !user?.name,
        email: false,
      });
    }
  }, [session, form, user?.name]);

  const { notify } = useContext(NotificationContext);

  const { isPending, mutate: updateProfileMutation } = useMutation({
    mutationFn: updateProfile,
    onSettled: () => {
      notify({
        message: 'Successfully updated the user profile',
        type: 'success',
      });
      setIsEditing({
        name: false,
        email: false,
      });
    },
    onError(error) {
      notify({
        message: error.message,
        type: 'error',
      });
    },
  });

  const onSubmit = (data: Profile) => {
    updateProfileMutation({ data, userId: user?.id });
  };

  const toggleEdit = (field: string) => {
    setIsEditing((prev) => ({ ...prev, [field]: !prev[field] }));
  };

  const handleBuyTokens = () => {
    // Implement token purchase logic here
    setTokens(tokens + 100);
    notify({
      message: 'Successfully purchased 100 tokens',
      type: 'success',
    });
  };

  const handleImageUpload = async (
    event: React.ChangeEvent<HTMLInputElement>,
  ) => {
    const file = event.target.files?.[0];
    if (!file) return;

    setIsUploading(true);
    try {
      const { url, fields } = await getPresignedUrl();
      await uploadImage(url, file);
      const imageUrl = `${url}/${fields.key}`;
      form.setValue('image', imageUrl);
      notify({
        message: 'Successfully uploaded image',
        type: 'success',
      });
    } catch (error) {
      notify({
        message: 'Failed to upload image',
        type: 'error',
      });
    } finally {
      setIsUploading(false);
    }
  };

  // Dummy data for charts
  const tokenSpendData = [
    { date: '2023-06-19', tokens: 50 },
    { date: '2023-06-20', tokens: 75 },
    { date: '2023-06-21', tokens: 60 },
    { date: '2023-06-22', tokens: 90 },
    { date: '2023-06-23', tokens: 80 },
    { date: '2023-06-24', tokens: 100 },
    { date: '2023-06-25', tokens: 70 },
  ];

  const genrePopularityData = [
    { genre: 'Action', count: 300 },
    { genre: 'Romance', count: 250 },
    { genre: 'Fantasy', count: 200 },
    { genre: 'Sci-Fi', count: 150 },
    { genre: 'Horror', count: 100 },
  ];

  const aiUsageData = [
    { name: 'Character Generation', value: 35 },
    { name: 'Plot Assistance', value: 25 },
    { name: 'Dialogue Writing', value: 20 },
    { name: 'Scene Description', value: 15 },
    { name: 'Translation', value: 5 },
  ];

  return (
    <div className="container mx-auto p-4">
      <Card className="w-full max-w-xl mx-auto mb-8">
        <CardHeader>
          <CardTitle className="text-2xl font-bold text-center">
            Manga AI Dashboard
          </CardTitle>
        </CardHeader>
        <CardContent>
          <Form {...form}>
            <form onSubmit={form.handleSubmit(onSubmit)} className="space-y-4">
              <FormField
                control={form.control}
                name="image"
                render={({ field }) => (
                  <FormItem>
                    <FormControl>
                      <div className="relative flex flex-row">
                        <Avatar className="w-24 h-24">
                          <AvatarImage
                            src={field.value || ''}
                            alt="User avatar"
                          />
                          <AvatarFallback>
                            {user?.email?.charAt(0).toUpperCase()}
                          </AvatarFallback>
                        </Avatar>
                        <Button
                          type="button"
                          variant="ghost"
                          size="sm"
                          className="m-2"
                          onClick={() =>
                            document.getElementById('imageUpload')?.click()
                          }
                          disabled={isUploading}
                        >
                          <Upload className="h-4 w-4" />
                        </Button>
                        <Input
                          id="imageUpload"
                          type="file"
                          accept="image/*"
                          className="hidden"
                          onChange={handleImageUpload}
                          disabled={isUploading}
                        />
                        <div className="flex flex-col items-end text-end w-full justify-center">
                          <div className="flex items-center mb-2 w-full text-end justify-end">
                            <Coins className="h-6 w-6 mr-2" />
                            <span className="text-xl font-bold">{tokens}</span>
                          </div>
                          <Button
                            onClick={handleBuyTokens}
                            variant="outline"
                            className="w-32"
                          >
                            Buy Tokens
                          </Button>
                        </div>
                      </div>
                    </FormControl>
                  </FormItem>
                )}
              />
              <FormField
                control={form.control}
                name="name"
                render={({ field }) => (
                  <FormItem>
                    <div className="flex items-center justify-between">
                      <FormLabel>Name</FormLabel>
                      <Button
                        type="button"
                        variant="ghost"
                        size="sm"
                        onClick={() => toggleEdit('name')}
                      >
                        {isEditing.name ? (
                          <Save className="h-4 w-4" />
                        ) : (
                          <Pencil className="h-4 w-4" />
                        )}
                      </Button>
                    </div>
                    <FormControl>
                      <Input {...field} disabled={!isEditing.name} />
                    </FormControl>
                    <FormMessage />
                  </FormItem>
                )}
              />

              <FormField
                control={form.control}
                name="email"
                render={({ field }) => (
                  <FormItem>
                    <div className="flex items-center justify-between">
                      <FormLabel>Email</FormLabel>
                      <Button
                        type="button"
                        variant="ghost"
                        size="sm"
                        onClick={() => toggleEdit('email')}
                      >
                        {isEditing.email ? (
                          <Save className="h-4 w-4" />
                        ) : (
                          <Pencil className="h-4 w-4" />
                        )}
                      </Button>
                    </div>
                    <FormControl>
                      <Input
                        {...field}
                        type="email"
                        disabled={!isEditing.email}
                      />
                    </FormControl>
                    <FormMessage />
                  </FormItem>
                )}
              />
              <Button type="submit" disabled={isPending} className="w-full">
                Save Changes
              </Button>
            </form>
          </Form>
        </CardContent>
      </Card>

      <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
        <Card>
          <CardHeader>
            <CardTitle>Daily Token Spend</CardTitle>
          </CardHeader>
          <CardContent>
            <ResponsiveContainer width="100%" height={300}>
              <LineChart data={tokenSpendData}>
                <XAxis dataKey="date" />
                <YAxis />
                <Tooltip />
                <Legend />
                <Line type="monotone" dataKey="tokens" stroke="#8884d8" />
              </LineChart>
            </ResponsiveContainer>
          </CardContent>
        </Card>

        <Card>
          <CardHeader>
            <CardTitle>Genre Popularity</CardTitle>
          </CardHeader>
          <CardContent>
            <ResponsiveContainer width="100%" height={300}>
              <BarChart data={genrePopularityData}>
                <XAxis dataKey="genre" />
                <YAxis />
                <Tooltip />
                <Legend />
                <Bar dataKey="count" fill="#82ca9d" />
              </BarChart>
            </ResponsiveContainer>
          </CardContent>
        </Card>

        <Card>
          <CardHeader>
            <CardTitle>AI Usage Distribution</CardTitle>
          </CardHeader>
          <CardContent>
            <ResponsiveContainer width="100%" height={300}>
              <PieChart>
                <Pie
                  data={aiUsageData}
                  dataKey="value"
                  nameKey="name"
                  cx="50%"
                  cy="50%"
                  outerRadius={80}
                  fill="#8884d8"
                  label
                />
                <Tooltip />
                <Legend />
              </PieChart>
            </ResponsiveContainer>
          </CardContent>
        </Card>
      </div>
    </div>
  );
};

export default ProfilePage;
