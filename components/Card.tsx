import { motion } from 'framer-motion';

const cardVariants = {
  offscreen: {
    y: 300,
  },
  onscreen: {
    y: 50,
    rotate: -10,
    transition: {
      type: 'spring',
      bounce: 0.4,
      duration: 0.8,
    },
  },
};

const hue = (h: number) => `hsl(${h}, 100%, 50%)`;

export default function Card({
  emoji,
  hueA,
  hueB,
}: {
  emoji: string;
  hueA: number;
  hueB: number;
}) {
  const background = `linear-gradient(306deg, ${hue(hueA)}, ${hue(hueB)})`;

  return (
    <motion.div
      className="card-container"
      initial="offscreen"
      whileInView="onscreen"
      viewport={{ once: true, amount: 0.8 }}
    >
      <div className="splash" style={{ background }} />
      <motion.div className="card" variants={cardVariants}>
        {emoji}
      </motion.div>
    </motion.div>
  );
}

// const food: [string, number, number][] = [
//   ["🍅", 340, 10],
//   ["🍊", 20, 40],
//   ["🍋", 60, 90],
//   ["🍐", 80, 120],
//   ["🍏", 100, 140],
//   ["🫐", 205, 245],
//   ["🍆", 260, 290],
//   ["🍇", 290, 320]
// ];
