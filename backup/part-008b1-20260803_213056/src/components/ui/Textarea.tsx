import type { TextareaHTMLAttributes } from "react";

export default function Textarea(
  props: TextareaHTMLAttributes<HTMLTextAreaElement>
) {
  return (
    <textarea
      {...props}
      style={{
        width: "100%",
        minHeight: "140px",
        padding: "12px",
        borderRadius: "10px",
        border: "1px solid #ddd",
      }}
    />
  );
}
