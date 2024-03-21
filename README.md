# Redux implementation with SwiftUI

Creating a Redux structure with SwiftUI and Combine.

- **State:** Represents the current state of the application. It's typically a struct or class that holds all the data necessary for rendering the UI. In SwiftUI + Combine, state is often defined using property wrappers like @State, @Binding, @ObservedObject, or @EnvironmentObject.
- **Store:** Manages the application state, dispatches actions, and notifies subscribers of state changes. It's usually implemented as a class conforming to ObservableObject protocol. In SwiftUI + Combine, the store publishes state updates using @Published property wrapper and combines actions with reducers to update the state.
- **Actions:** Plain Swift structs or enums that represent events or intents to change the application state. Actions carry the necessary information to describe what happened in the application. They are dispatched to the store.
- **Reducer:** Pure functions that take the current state and an action, and return a new state. Reducers define how the application's state changes in response to dispatched actions. They are responsible for updating the state immutably.
- **Middleware:** Intercepts actions before they reach the reducers, allowing for side effects, asynchronous operations, or other advanced logic. Middleware is optional and sits between the action dispatch and the reducer. It enhances the capabilities of Redux by enabling handling of async operations and performing side effects.

![Redux Architecture](https://github.com/heitormurara/ThreeDucks/blob/main/SwiftUI%2BRedux.png)
