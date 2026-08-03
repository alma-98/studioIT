import type { SelectHTMLAttributes } from "react";

export default function Select(
  props: SelectHTMLAttributes<HTMLSelectElement>
) {
  return (
    <select
      {...props}
      style={{
        width: "100%",
        padding: "12px",
        borderRadius: "10px",
        border: "1px solid #ddd",
      }}
    />
  );
}
