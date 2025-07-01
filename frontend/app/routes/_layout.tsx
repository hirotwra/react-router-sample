// 共通レイアウト
import { Outlet } from "react-router";
import NavBar from "../components/navbar";

export default function Layout() {
  return (
    <div>
      <h1>共通ヘッダー部</h1>
      <NavBar />
      <Outlet />
    </div>
  );
}
