// reducers/authReducer.ts

// Define o tipo para o estado
export type State = {
    isAuthenticated: boolean;
    user: string | null;
  };
  
  // Define o tipo para as ações
  export type Action =
    | { type: 'LOGIN'; payload: string }
    | { type: 'LOGOUT' };
  
  // Estado inicial
  export const initialState: State = {
    isAuthenticated: false,
    user: null,
  };
  
  // Reducer para gerenciar as ações de autenticação
  export const authReducer = (state: State, action: Action): State => {
    switch (action.type) {
      case 'LOGIN':
        return { ...state, isAuthenticated: true, user: action.payload };
      case 'LOGOUT':
        return { ...state, isAuthenticated: false, user: null };
      default:
        return state;
    }
  };
  