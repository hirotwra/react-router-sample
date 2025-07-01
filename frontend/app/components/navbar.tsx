// frontend/app/components/NavBar.tsx
import { Link } from "react-router";

export default function NavBar() {
  return (
    <nav style={{ padding: "1rem", borderBottom: "1px solid #ccc" }}>
      <Link to="/">Home</Link> |{" "}
      <Link to="/about">About</Link> |{" "}
      <Link to="/user">User</Link> |{" "}
      <Link to="/task">Task</Link>
    </nav>
  );
}
