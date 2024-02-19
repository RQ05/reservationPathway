import Vapor
import Fluent
import FluentPostgresDriver

// configures your application
public func configure(_ app: Application) async throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    // register routes
    try app.register(collection: UserController())
    try app.register(collection: RoomController())
    try app.register(collection: ReserveController())
    
    try routes(app)
    
    app.databases.use(.postgres(configuration: SQLPostgresConfiguration(hostname: "localhost", username: "postgres", password: "", database: "reservationapp" , tls: .prefer(try .init(configuration: .clientDefault)))), as: .psql)

    
    //so we upload fluent and make the database .. now its time to make the tables inside users :)
    app.migrations.add(CreateUser())
    app.migrations.add(CreateRoom())
    app.migrations.add(CreateReservation())
}
