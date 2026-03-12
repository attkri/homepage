import { format } from "date-fns";
import { de } from "date-fns/locale";

const dateFormat = (
  date: Date | string,
  pattern: string = "dd. MMM yyyy",
): string => {
  let dateObj: Date;

  if (typeof date === "string") {
    const match = date.match(/^(\d{4})-(\d{2})-(\d{2})/);
    if (match) {
      dateObj = new Date(Number(match[1]), Number(match[2]) - 1, Number(match[3]), 12, 0, 0);
    } else {
      dateObj = new Date(date);
    }
  } else {
    dateObj = date;
  }

  const output = format(dateObj, pattern, { locale: de });
  return output;
};

export default dateFormat;
