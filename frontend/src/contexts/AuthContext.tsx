// contexts/AuthContext.tsx

import React, { createContext, useReducer, ReactNode } from 'react';
import { authReducer, initialState, State, Action } from '../reducers/authReducer';

// Define o tipo para o contexto
type AuthContextType = {
    state: State;
    dispatch: React.Dispatch<Action>;
};

// Cria o contexto
export const AuthContext = createContext<AuthContextType | undefined>(undefined);

// Provedor do contexto
export const AuthProvider: React.FC<{ children: ReactNode }> = ({ children }) => {
    const [state, dispatch] = useReducer(authReducer, initialState);

    return (
        <AuthContext.Provider value={{ state, dispatch }}>

            {children}

        </AuthContext.Provider>
    );
};
