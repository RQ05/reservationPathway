
#  Reservation System

The system comprises three tables to facilitate room reservations. It initially creates a user, displays their information, updates it, and finally deletes it. Similarly, it creates a room, displays its information, updates it, and deletes it. Consequently, the system supports reservation management, enabling users to create, update, delete, and display reservation information.


## App Statment :
A system that enables learners to book meeting rooms within the academy building.
## Feature list:

- The system contains three tables that enable the user to reserve a room.
- Firstly the system creates user , show her/his information , update them and lastly delete.
- As well, creates a room , show its information , update them and delete it. 
- So the system with those approaches will allow to make. A reservation . 
Therefore  the reservation will be exist and the user can create , update ,delete and show the reservation information.


## Database schema:

#### User Table


| Column | Type     |
| :-------- | :------- |
| `UserID` | `uuid` |
| `User Name`  | `String` | 
| `Email` | `String` | 
| `Role` | `String` |

#### Reservation Table 


| Column | Type     | 
| :-------- | :------- | 
| `RoomID` | `uuid` | 
| `RoomName`  | `String` | 
| `Capacity` | `INT` | 
| `Discription` | `String` |
| `Equipment` | `String` | 
| `Availability` | `String` | 

#### Rooms Table


| Column | Type     | 
| :-------- | :------- |
| `Reservation ID` | `uuid` |
| `Room ID`  | `uuid` |
| `User ID` | `uuid` | 
| `Start Date` | `DateTime` |
| `Day Hours` | `String` |
| `Reservation State` | `String` |




## Screenshots

![App Screenshot](https://via.placeholder.com/468x300?text=App+Screenshot+Here)

