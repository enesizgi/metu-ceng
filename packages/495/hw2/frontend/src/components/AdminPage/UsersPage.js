import React from "react";
import {
  Container,
  Button,
  Typography,
  LinearProgress,
  Card,
} from "@material-ui/core";
import AddIcon from "@material-ui/icons/Add";
import { UserItem } from "../UserItem";
import { useUsers } from "../../hooks/useUsers";
import { useShowLoader } from "../../hooks/util-hooks";
import { WelcomePage } from "../WelcomePage";

export const UsersPage = ({
  handleBackButtonClick
}) => {
  const { loading, users, ...userActions } = useUsers();
  const showLoader = useShowLoader(loading, 200);
  const [isAddUserClicked, setIsAddUserClicked] = React.useState(false);

  console.log(users);
  const onRegisterHandler = () => {
    setIsAddUserClicked(false);
  };

  return (
    <>
      <Button
        variant="contained"
        color="secondary"
        onClick={handleBackButtonClick}
      >
        Go Back
      </Button>
      {!isAddUserClicked && <Container className="main-container" maxWidth="sm">
        {(loading && showLoader) ? (
          <LinearProgress />
        ) : (
          <div>
            <div className="title-container">
              <h2>
                {`You have ${users.length} user${users.length === 1 ? "" : "s"
                  }`}
              </h2>
              <Button
                variant="contained"
                color="primary"
                startIcon={<AddIcon />}
                onClick={() => {
                  setIsAddUserClicked(true);
                }}
              >
                Add User
              </Button>
            </div>
            <div className="main-container">
              {users.map((user) => (
                <Card style={{ width: "600px", height: "300px" }}>
                  <UserItem
                    key={String(user._id)}
                    user={user}
                    userActions={userActions}
                  />
                </Card>
              ))}
            </div>
          </div>
        )}
      </Container>}
      {isAddUserClicked && <WelcomePage
        isAdminLogin={true}
        onRegisterHandler={onRegisterHandler}
      />}
    </>
  );
};