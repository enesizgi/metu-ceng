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
          value={user.summary}
          onChange={(e) => {
            draftUserActions.setDraftTodoSummary(user, e.target.value);
          }}
        />
      </ListItemText>
      <ListItemSecondaryAction>
        <Button
          variant="outlined"
          size="small"
          onClick={async () => {
            await userActions.saveTodo(user);
            draftUserActions.deleteDraftTodo(user);
          }}
        >
          Save
        </Button>
        <IconButton
          edge="end"
          size="small"
          onClick={() => {
            draftUserActions.deleteDraftTodo(user);
          }}
        >
          <ClearIcon />
        </IconButton>
      </ListItemSecondaryAction>
    </ListItemWithTwoSecondaryActions>
  );
};
