import { Stack, useRouter, useSegments } from "expo-router";
import { useEffect, useState } from "react";
import auth, { FirebaseAuthTypes } from "@react-native-firebase/auth";
import { View, ActivityIndicator } from "react-native";

export const RootLayout = () => {
  const [initializing, setInitializing] = useState(true);
  const [user, setUser] = useState<FirebaseAuthTypes.User | null>();
  const router = useRouter();
  const segments = useSegments();

  const onAuthStateChanged = (user: FirebaseAuthTypes.User | null) => {
    console.log("onAuthStateChanged", user);
    setUser(user);
    if (initializing) setInitializing(false);
  };

  useEffect(() => {
    const subscriber = auth().onAuthStateChanged(onAuthStateChanged);
    return subscriber;
  });

  useEffect(() => {
    if (initializing) return;

    const inAuthGroup = segments[0] === "(vendor)";

    if (user && !inAuthGroup) {
      router.replace("../(vendor)/home.tsx");
    } else if (!user && inAuthGroup) {
      router.replace("/");
    }
  }, [user, initializing, router, segments]);

  if (initializing)
    return (
      <View
        style={{
          alignItems: "center",
          justifyContent: "center",
          flex: 1,
        }}
      >
        <ActivityIndicator size="large" />
      </View>
    );

  return (
    <Stack>
      <Stack.Screen name="(auth)" options={{ title: "Login" }} />
      <Stack.Screen name="(vendor)" options={{ headerShown: false }} />
    </Stack>
  );
};

export default RootLayout;
