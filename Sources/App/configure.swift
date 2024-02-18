import Vapor

// configures your application
public func configure(_ app: Application) async throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    // register routes
    try app.register(collection: UserController())
    try app.register(collection: RoomController())
    try app.register(collection: ReserveController())
    try routes(app)
}
