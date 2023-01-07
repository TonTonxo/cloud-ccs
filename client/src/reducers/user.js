const user = (state = {}, action) => {
  switch (action.type) {
    case "SET_USER":
      console.log("reducer reached!!");
      return {
        ...state,
        username: action.username,
      };

    default:
      console.log("Default called");
      return state;
  }
};

export default user;
