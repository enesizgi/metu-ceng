import styled from 'styled-components';

const ScTable = styled.table`
    border-collapse: collapse;
    box-shadow: 0px 0px 10px #36304a;

    & > thead > tr {
        background-color: #36304a;
        text-align: center;

        th {
            background-color: #36304a;
            color: white;
            font-size: 18px;
            padding: 10px;
        }

        & > th:first-child {
            border-top-left-radius: 15px;
        }

        & > th:last-child {
            border-top-right-radius: 15px;
        }
    }

    & > tbody {
        tr {
            background-color: #a69fbe;
            padding: 10px;
            text-align: center;

            td {
                width: 60px;

                button {
                    background-color: #36304a;
                    color : white;
                    width: 100%;
                    height: 30px;
                    padding: 0;
                    box-shadow: 0px 0px 10px #36304a;
                }

            }
        }
    }
`;

export default ScTable;