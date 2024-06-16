import { generateResponse } from "@/lib/google";
import { NextRequest, NextResponse } from "next/server";

interface IInput {
  name: String;
  setting: String;
  creature: String;
  prompt: String;
  history: String;
  pages: Number;
  pageNo: Number;
}

export const POST = async (req: NextRequest, res: NextResponse) => {
  const { name, setting, creature, prompt, history, pages, pageNo }: IInput =
    await req.json();
  var response = null;
  try {
    response = await generateResponse(
      name,
      setting,
      creature,
      prompt,
      history,
      pages,
      pageNo,
    );
    return NextResponse.json(response);
  } catch (error) {
    console.error(error);
    return NextResponse.json({ message: "Some error Occures" });
  }
};
