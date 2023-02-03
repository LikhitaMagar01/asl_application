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
                <div
                    class="hidden lg:inline-flex text-sm lg:text-base text-white space-x-4 lg:space-x-8 font-primary"
                >
                    <a href="#">Home</a>
                    <a href="#">Features</a>
                    <a href="#">Screenshots</a>
                    <a href="#">Testimonial</a>
                    <a href="#">Plans</a>
                    <a href="#">Download</a>
                    <a href="#">Contact</a>
                </div>
            </nav>
        </header>
        <LandingPage />
    </div>
</template>

<script setup>
import LandingPage from '@/components/LandingPage'
</script>