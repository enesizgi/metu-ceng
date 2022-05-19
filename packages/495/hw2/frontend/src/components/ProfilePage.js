import React, { useEffect, useState, useMemo } from "react";
import { Button, Card, Container, TextField } from "@material-ui/core";
import { useUsers } from "../hooks/useUsers";

export const ProfilePage = ({ currentUser }) => {
  const { loading, users, totalUsers, ...userActions } = useUsers(1);
  const [user, setUser] = useState({});
  const [userID, setUserID] = useState("");

  const userLabels = useMemo(
    () => ({
      username: "username",
    }), []);

  useEffect(() => {
    setUserID(currentUser?.id);
  }, [currentUser]);

  const userChangeHandler = label => e => {
    const newUser = { [label]: e.target.value };
    setUser(newUser);
  };

  return (
    <Container
      maxWidth="sm"
      style={{
        marginTop: "32px"
      }}
    >
      <Card>
        <div
          style={{margin: "10px", fontSize: "30px", display: "flex", justifyContent: "center"}}
        >Profile Page</div>
        <div style={{ margin: "10px", display: "flex" }}>
          Username:
          <TextField
            value={user.username || users[0]?.username}
            onChange={userChangeHandler(userLabels.username)}
            style={{ marginLeft: "16px" }}
          />
        </div>
        <Button
          variant="contained"
          color="secondary"
          onClick={() => userActions.updateUser(userID, user)}
          style={{ margin: "10px" }}
        >Save</Button>

      </Card>
    </Container>

  );
}