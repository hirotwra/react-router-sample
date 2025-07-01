// クライアントサイドルーティングを定義する
import { type RouteConfig, index, route } from "@react-router/dev/routes";

export default [
  route("", "routes/_layout.tsx", [
    index("routes/home.tsx"),            // "/"
    route("about", "routes/about.tsx"),  // "/sbout"
    route("user", "routes/user.tsx"),    // "/user"
    route("task", "routes/task.tsx")     // "/task"
  ])
] satisfies RouteConfig;
