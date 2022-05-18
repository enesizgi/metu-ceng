import React from "react";
import {
  Container,
  Button,
  Typography,
  List,
  LinearProgress,
  Card,
} from "@material-ui/core";
import AddIcon from "@material-ui/icons/Add";
import { UserItem } from "../UserItem";
import { DraftUserItem } from "../DraftUserItem";
import { useUsers } from "../../hooks/useUsers";
import { useDraftUsers } from "../../hooks/useDraftUsers";
import { useShowLoader } from "../../hooks/util-hooks";

export const UsersPage = ({
  handleBackButtonClick
}) => {
  const { loading, users, ...userActions } = useUsers();
  const { draftUsers, ...draftUserActions } = useDraftUsers();
  const showLoader = useShowLoader(loading, 200);
  console.log(users);
  console.log(draftUsers);

  return (
    <>
      <Button
        variant="contained"
        color="secondary"
        onClick={handleBackButtonClick}
      >
        Go Back
      </Button>
      <Container className="main-container" maxWidth="sm">
        {loading ? (
          showLoader ? (
            <LinearProgress />
          ) : null
        ) : (
          <div className="todo-items-container">
            <Typography component="p" variant="h5">
              {`You have ${users.length} To-Do Item${users.length === 1 ? "" : "s"
                }`}
            </Typography>
            <Button
              variant="contained"
              color="primary"
              startIcon={<AddIcon />}
              onClick={() => draftUserActions.createDraftUser()}
            >
              Add User
            </Button>
            
              {users.map((user) => (
                <Card style={{width: "600px", height: "300px"}}>
                  <UserItem
                    key={String(user._id)}
                    user={user}
                    userActions={userActions}
                  />
                </Card>
              ))}
              {draftUsers.map((draft) => (
                <DraftUserItem
                  key={String(draft._id)}
                  user={draft}
                  userActions={userActions}
                  draftUserActions={draftUserActions}
                />
              ))}
            
          </div>
        )}
      </Container>
    </>
  );
};