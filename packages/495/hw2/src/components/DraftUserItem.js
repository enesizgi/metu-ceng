import React from "react";
import {
  TextField,
  Button,
  IconButton,
  ListItem,
  ListItemSecondaryAction,
  ListItemText,
  withStyles,
} from "@material-ui/core";
import ClearIcon from "@material-ui/icons/Clear";

const ListItemWithTwoSecondaryActions = withStyles({
  secondaryAction: {
    paddingRight: "120px",
  },
})(ListItem);

export const DraftUserItem = ({ user, userActions, draftUserActions }) => {
  return (
    <ListItemWithTwoSecondaryActions>
      <ListItemText inset>
        <TextField
          style={{ width: "100%" }}
          placeholder="What needs doing?"
          size="small"
          value={user.username}
          onChange={(e) => {
            // draftUserActions.setDraftTodoSummary(user, e.target.value);
          }}
        />
      </ListItemText>
      <ListItemSecondaryAction>
        <Button
          variant="outlined"
          size="small"
          onClick={async () => {
            await userActions.saveUser(user);
            draftUserActions.deleteDraftUser(user);
          }}
        >
          Save
        </Button>
        <IconButton
          edge="end"
          size="small"
          onClick={() => {
            draftUserActions.deleteDraftUser(user);
          }}
        >
          <ClearIcon />
        </IconButton>
      </ListItemSecondaryAction>
    </ListItemWithTwoSecondaryActions>
  );
};
