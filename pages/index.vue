<template>
    <div>
        <header
            class="fixed inset-0 h-16 bg-gray-800 flex justify-between items-center px-3"
        >
            <img class="h-8 w-10 rounded-sm" src="/static/images/logo.jpeg" alt="happy" />
            <nav class="flex items-center h-16 text-white">
                <svg
                    class="md:hidden h-8 px-3 py-1 border rounded-sm"
                    xmlns="http://www.w3.org/2000/svg"
                    fill="none"
                    viewBox="0 0 24 24"
                    stroke="currentColor"
                >
                    <path
                        stroke-linecap="round"
                        stroke-linejoin="round"
                        stroke-width="1"
                        d="M4 6h16M4 12h16M4 18h16"
                    />
                </svg>
                <div>
                    <a
                        href="#"
                        class="mr-4 px-4 py-3 text-white border-2 border-white rounded-full font-bold uppercase font-primary hover:shadow-md"
                        >Sign In</a
                    >
                    <a
                        href="#"
                        class=" bg-white px-4 py-3 text-blue-500 rounded-full font-bold font-primary"
                        >Sign Up</a
                    >
                </div>
            </nav>
        </header>
        <LandingPage />
    </div>
</template>

<script setup>
import LandingPage from '@/components/LandingPage'
</script>