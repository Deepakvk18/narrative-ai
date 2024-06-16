import { GoogleGenerativeAI } from '@google/generative-ai';

const genAI = new GoogleGenerativeAI(process.env.GOOGLE_API_KEY || '');

const model = genAI.getGenerativeModel({ model: 'gemini-pro' });

function getPrompt(
  name: String,
  setting: String,
  creature: String,
  prompt: String,
  history: String,
  pages: Number,
  pageNo: Number,
) {
  return `You are an amazing story teller. Everyone calls you dreamer. 
    A person named ${name} has asked you to write a story about ${creature} and in a ${setting} setting. You have to create an amazing continuation of the story. If the total pages and pageNo is equal, story should complete ther. Plan accordingly. you have to complete the story at any cost. The climax should happen then and there. Otherwise, leave the ending of the particular chapter in suspense. The user has also provided some custom instructions: ${prompt}. 
    Total No of Pages: ${pages}
    This Page No: ${pageNo}
    The story so far goes like this: ${history}
    Also, there should be a title for that particular chapter. Generate only one chapter at a time.`;
}

export default async function generateResponse(
  name: String,
  setting: String,
  creature: String,
  prompt: String,
  history: String,
  pages: Number,
  pageNo: Number,
) {
  const generatedPrompt = getPrompt(
    name,
    setting,
    creature,
    prompt,
    history,
    pages,
    pageNo,
  );
  const result = await model.generateContent(generatedPrompt);
  const response = await result.response;
  const text = response.text();
  return text;
}
