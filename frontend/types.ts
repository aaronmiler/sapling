export interface Ping {
  message: string
  // js_from_routes camelCases response keys (served_at → servedAt)
  servedAt: string
}
