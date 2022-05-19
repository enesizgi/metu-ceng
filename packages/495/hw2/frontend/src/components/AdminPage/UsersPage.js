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
  const [pageNumber, setPageNumber] = React.useState(1);
  const { loading, users, totalUsers, ...userActions } = useUsers(pageNumber);
  const showLoader = useShowLoader(loading, 200);
  const [isAddUserClicked, setIsAddUserClicked] = React.useState(false);

  console.log(users);
  const onRegisterHandler = () => {
    setIsAddUserClicked(false);
  };

  const marginStyle = {
    margin: "10px"
  };

  return (
    <>
      <Button
        variant="contained"
        color="secondary"
        onClick={handleBackButtonClick}
        style={{ margin: "10px" }}
      >
        Go Back
      </Button>
      {!isAddUserClicked && <Container className="main-container" maxWidth={false} style={{padding: 0, margin: 0}}>
        {(loading && showLoader) ? (
          <LinearProgress />
        ) : (
          <div style={{display: 'block', width: "100%", maxWidth: '100%'}}>
            <div className="title-container">
              <h2>
                {`You have ${totalUsers} user${totalUsers === 1 ? "" : "s"
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
              <div style={marginStyle}>
                <Button
                  variant="contained"
                  color="primary"
                  onClick={() => setPageNumber(prev => Math.max(prev - 1, 0))}
                  style={marginStyle}
                >
                  Previous Page
                </Button>
                <Button
                  variant="contained"
                  color="primary"
                  onClick={() => setPageNumber(prev => Math.min(prev + 1, Math.ceil(totalUsers / 3)))}
                  style={marginStyle}
                >
                  Next Page
                </Button>
              </div>
            </div>
            <div className="main-container"> 
              {users.map((user) => (
                <Card style={{minWidth: '25%', padding: '16px', margin: '16px' }}>
                  <UserItem
                    key={JSON.stringify(user)}
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